/*
    4-bit hashing (~50% match)
    hash = ((symbol & 60) ^ (symbol >> 1) ^ (symbol >> 5)) & 15;

    f3 NN = f3::divf( N, f3::dot( N, L ) );
    float t_2 = f3::dot(P0L0, NN);
*/

typedef unsigned char      xlz_uint8;
typedef unsigned short     xlz_uint16;
typedef unsigned int       xlz_uint32;
typedef unsigned long long xlz_uint64;

xlz_uint32 Test(void* dstData, void* srcData, xlz_uint32 srcByteWidth);

/*
#include <iostream>
#include <cmath>

#define degtorad(angleInDegrees) ((angleInDegrees) * M_PI / 180.0)
#define radtodeg(angleInRadians) ((angleInRadians) * 180.0 / M_PI)

typedef struct f3
{
    f3(float _x, float _y, float _z) : x(_x), y(_y), z(_z) {};
    static float dot(f3 a, f3 b) { float d = (a.x*b.x)+(a.y*b.y)+(a.z*b.z);
        return d; }
    static f3 sub(f3 a, f3 b) { f3 c(a.x-b.x,a.y-b.y,a.z-b.z); return c; }
    static f3 divf(f3 a, float b) { f3 c(a.x/b,a.y/b,a.z/b); return c; }
    static f3 divf3(f3 a, f3 b) { f3 c(a.x/b.x,a.y/b.y,a.z/b.z); return c; }
    float x, y, z;
} f3;

float FourierCoefA0(float period, float* sx)
{
    float dx = 1.0f / 5.0f;
    float coefA0 = ((sx[0]*dx)+(sx[1]*dx)+
                   (sx[2]*dx)+(sx[3]*dx)+(sx[4]*dx));
    return (1.0f / period) * coefA0;
}

float FourierCoefAn(float period, float* sx, float n)
{
    float dx = 1.0f / 5.0f;
    float coefAn = ((sx[0]*cos(n*(-0.5f))*dx)+(sx[1]*cos(n*(-0.25f))*dx)+
                   (sx[2]*cos(n*0.0f)*dx)+(sx[3]*cos(n*0.25f)*dx)+(sx[4]*cos(n*0.5f)*dx));
    return (1.0f / period) * coefAn;
}

float FourierCoefBn(float period, float* sx, float n)
{
    float dx = 1.0f / 5.0f;
    float coefAn = ((sx[0]*sin(n*(-0.5f))*dx)+(sx[1]*sin(n*(-0.25f))*dx)+
                   (sx[2]*sin(n*0.0f)*dx)+(sx[3]*sin(n*0.25f)*dx)+(sx[4]*sin(n*0.5f)*dx));
    return (1.0f / period) * coefAn;
}

// To approximate a function
// using basis functions we must work out a scalar value that
// represents how much the original function f(x) is like the each
// basis function Bi(x). We do this by integrating the product f(x)Bi(x)
// over the full domain of f. 
// 
// Using this projection process over all our basis functions returns 
// vector of approximation coefficients. If we scale the corresponding
// basis function by the coefficients…
// … and sum the results we obtain our approximated function. 
//
float getBasisCosine(float x, float mul)
{
    const float PI = 3.14159265f;
    // x = 1.0f * (x + mul);
    // float v = (((PI * PI) - (x * x)) / ((PI * PI) + (x * x * x * x * x * x))); // Bhaskara
    // float v = (x * x * x * x) - (2.0f * (x * x)) + 1.0f; // Hermite4 MOD
    // x *= 0.34f;
    // float v = 2.0f * ((x * x * x * x) - (2.0f * (x * x)) + 0.5f); // Legendre4 MOD
    float v = cos(PI * x * mul);
    // float v = 1.0f / (1.0f + (64.0f * x * x * x * x));
    return v;
}
float getBasisLegendre(float x, int n)
{
    switch (n)
    {
        case 0 : return 1.0f;
        case 1 : return x;
        case 2 : return ((3.0f * x * x) - 1.0f) / 2.0f;
        case 3 : return ((5.0f * x * x * x) - (3.0f * x)) / 2.0f;
        case 4 : return ((35.0f * x * x * x * x) - (30.0f * x * x) + 3.0f) / 8.0f;
        default : return 1.0f;
    }
    return 1.0f;
}
float getBasisHermite(float x, int n)
{
    switch (n)
    {
        case 0 : return 1.0f;
        case 1 : return x;
        case 2 : return (x * x) - 1.0f;
        case 3 : return (x * x * x) - (3.0f * x);
        case 4 : return ((x * x * x * x) - (6.0f * x * x) + 3.0f);
        default : return 1.0f;
    }
    return 1.0f;
}
constexpr int getIdx(int w, int idxX, int idxY) { return idxX + (idxY * w); }
float integrate2d(float nsx, float* sx, int biidx, float* wgx, float* wgy)
{
    float wnsx = sqrt(nsx);
    float dx = 1.0f / wnsx;
    float dy = 1.0f / wnsx;
    int idxMax = (int)wnsx;
    float result = 0.0f;
    float x = -1.0f, y = -1.0f;
    for (int idxY = 0; idxY < idxMax; ++idxY, y += 1.0f) // domain
    {
        for (int idxX = 0; idxX < idxMax; ++idxX, x += 1.0f)
        {
            int idx = getIdx( idxMax, idxX, idxY );
            float bix = dx * getBasisLegendre( x+wgx[idx], biidx - 1 );
            float biy = dy * getBasisLegendre( y+wgy[idx], biidx - 1 );
            float bi = bix * biy;
            float fnx = sx[idx];
            float ite = fnx * bi;
            result += ite;
            // std::cout << std::endl;
            // std::cout << "Basis  = " << biidx << std::endl;
            // std::cout << "x      = " << x << " " << y << std::endl;
            // std::cout << "Signal = " << sx[ getIdx( idxMax, idxX, idxY ) ] << std::endl;
            // std::cout << "Coef   = " << ite << std::endl;
        }
        x = -1.0f;
    }
    result *= 0.5f * ((2.0f * (float)biidx) - 1.0f);
    return result;
}
float integrate(float nsx, float* sx, int biidx)
{
    float dx = 1.0f / nsx;
    float bifmul[4] = { 1.0f, 2.0f, 4.0f, 6.0f }; 
    int idx = 0;
    int idxMax = (int)nsx;
    float result = 0.0f;
    float x = -1.0f;
    for (int idx = 0; idx < idxMax; ++idx, x += 0.25f) // domain
    {
        float bix = getBasisLegendre( x, biidx );
        float fnx = sx[ idx ];
        float ite = fnx * bix * dx;
        result += ite;
        // std::cout << std::endl;
        // std::cout << "Basis  = " << biidx << std::endl;
        // std::cout << "x      = " << x << std::endl;
        // std::cout << "Signal = " << sx[ idx ] << std::endl;
        // std::cout << "Coef   = " << ite << std::endl;
    }
    return result;
}
float approx(float nks, float* ks, float nbf, float x, float y, float* wgx, float* wgy)
{
    int idxX = (int)round(x + 1.0f);
    int idxY = (int)round(y + 1.0f);
    int idxMax = (int)sqrt(nbf);
    int idx = getIdx(idxMax, idxX, idxY);
    float summ = 0.0f;
    for (int idx = 1; idx <= 5; ++idx) // basis
    {
        float bix = getBasisLegendre( x+wgx[idx], idx - 1 );
        float biy = getBasisLegendre( y+wgy[idx], idx - 1 );
        float bi = bix * biy;
        summ += ks[ idx - 1 ] * bi;
        // std::cout << std::endl;
        // std::cout << "Basis  = " << idx << std::endl;
        // std::cout << "x      = " << x << " " << y << std::endl;
        // std::cout << "Coef   = " << ks[ idx ] << std::endl;
        // std::cout << "BX     = " << ks[ idx ] * bi << std::endl;
    }
    return summ;
}

int main()
{
    const float PI = 3.14159265f;
    float signals[9] = {
                          0.0f, 0.0f, 0.0f,
                          0.0f, 1.0f, 0.0f,
                          0.0f, 0.0f, 0.0f
                       };
    float signals2d[9] = {
                          0.0f, 0.0f, 1.0f,
                          0.0f, 1.0f, 1.0f,
                          0.0f, 0.0f, 0.0f
                        };
    float weightsX[9] = {
                          0.0f, 0.0f, 0.0f,
                          0.0f, 0.0f, 0.0f,
                          0.0f, 0.0f, 0.0f
                        };
    float weightsY[9] = {
                          0.0f, 0.0f, 0.0f,
                          0.0f, 0.0f, 0.0f,
                          0.0f, 0.0f, 0.0f
                        };
    
    std::cout << "Basis function" << std::endl;
    float k0 = integrate2d(9.0f, &signals2d[0], 1, &weightsX[0], &weightsY[0]);
    float k1 = integrate2d(9.0f, &signals2d[0], 2, &weightsX[0], &weightsY[0]);
    float k2 = integrate2d(9.0f, &signals2d[0], 3, &weightsX[0], &weightsY[0]);
    float k3 = integrate2d(9.0f, &signals2d[0], 4, &weightsX[0], &weightsY[0]);
    float k4 = integrate2d(9.0f, &signals2d[0], 5, &weightsX[0], &weightsY[0]);
    std::cout << k0 << "; " << k1 << "; " << k2 << "; " << k3 << "; " << k4 << std::endl;
    float ks[5] = { k0, k1, k2, k3, k4 };
    float x0 = approx( 9.0f, ks, 9.0f, -1.0f, -1.0f, &weightsX[0], &weightsY[0] );
    float x1 = approx( 9.0f, ks, 9.0f, 0.0f, -1.0f, &weightsX[0], &weightsY[0] );
    float x2 = approx( 9.0f, ks, 9.0f, 1.0f, -1.0f, &weightsX[0], &weightsY[0] );
    float x3 = approx( 9.0f, ks, 9.0f, -1.0f, 0.0f, &weightsX[0], &weightsY[0] );
    float x4 = approx( 9.0f, ks, 9.0f, 0.0f, 0.0f, &weightsX[0], &weightsY[0] );
    float x5 = approx( 9.0f, ks, 9.0f, 1.0f, 0.0f, &weightsX[0], &weightsY[0] );
    float x6 = approx( 9.0f, ks, 9.0f, -1.0f, 1.0f, &weightsX[0], &weightsY[0] );
    float x7 = approx( 9.0f, ks, 9.0f, 0.0f, 1.0f, &weightsX[0], &weightsY[0] );
    float x8 = approx( 9.0f, ks, 9.0f, 1.0f, 1.0f, &weightsX[0], &weightsY[0] );
    // std::cout << "Approximate -1.0  = " << x0 << std::endl;
    // std::cout << "Approximate -0.75 = " << x1 << std::endl;
    // std::cout << "Approximate -0.5  = " << x2 << std::endl;
    // std::cout << "Approximate -0.25 = " << x3 << std::endl;
    // std::cout << "Approximate +0.0  = " << x4 << std::endl;
    // std::cout << "Approximate +0.25 = " << x5 << std::endl;
    // std::cout << "Approximate +0.5  = " << x6 << std::endl;
    // std::cout << "Approximate +0.75 = " << x7 << std::endl;
    // std::cout << "Approximate +1.0  = " << x8 << std::endl;
    std::cout << "Approximated signals : " << std::endl;
    std::cout << x0 << " " << x1 << " " << x2 << std::endl;
    std::cout << x3 << " " << x4 << " " << x5 << std::endl;
    std::cout << x6 << " " << x7 << " " << x8 << std::endl;
    std::cout << "Error : " << std::endl;
    std::cout << fabs(x0 - signals2d[getIdx(3,0,0)]) << " " <<
                 fabs(x1 - signals2d[getIdx(3,1,0)]) << " " <<
                 fabs(x2 - signals2d[getIdx(3,2,0)]) << " " << std::endl
              << fabs(x3 - signals2d[getIdx(3,0,1)]) << " " <<
                 fabs(x4 - signals2d[getIdx(3,1,1)]) << " " <<
                 fabs(x5 - signals2d[getIdx(3,2,1)]) << " " << std::endl
              << fabs(x6 - signals2d[getIdx(3,0,2)]) << " " <<
                 fabs(x7 - signals2d[getIdx(3,1,2)]) << " " <<
                 fabs(x8 - signals2d[getIdx(3,2,2)]) << std::endl;
    
    std::cout << std::endl << "Fourier" << std::endl;
    // an = 1/PI + INTG( s(x)*cos(n*x) )
    // bn = 1/PI + INTG( s(x)*sin(n*x) )
    float a0 = FourierCoefA0( 0.5f, &signals[0]);
    float a1 = FourierCoefAn( 0.5f, &signals[0], 1.0f );
    float a2 = FourierCoefAn( 0.5f, &signals[0], 2.0f );
    float b0 = FourierCoefBn( 0.5f, &signals[0], 0.0f );
    float b1 = FourierCoefBn( 0.5f, &signals[0], 1.0f );
    float b2 = FourierCoefBn( 0.5f, &signals[0], 2.0f );
    
    std::cout << a0 << ", " << a1 << ", " << a2 << std::endl;
    std::cout << b0 << ", " << b1 << ", " << b2 << std::endl;
    
    // s(x) = a0/2 + SUMM( an*cos(nx) + bn*sin(nx) )
    float xx = 0.5f;
    float s0 = (a0/2.0f) +
               (a1 * cos(1.0f * xx)) + (b1 * sin(1.0f * xx)) +
               (a2 * cos(2.0f * xx)) + (b2 * sin(1.0f * xx));
    
    std::cout << s0 << std::endl;
    
    return 0;
}
*/

/*
#include <iostream>
#include <cmath>

constexpr float PI = 3.14159265f;
constexpr int getidx(int w, int x, int y) { return x + (w * y); }

float getBasisLegendre(int n, float x)
{
    switch (n)
    {
        case 0 : return 1.0f;
        case 1 : return x;
        case 2 : return ((3.0f * x * x) - 1.0f) / 2.0f;
        case 3 : return ((5.0f * x * x * x) - (3.0f * x)) / 2.0f;
        case 4 : return ((35.0f * x * x * x * x) - (30.0f * x * x) + 3.0f) / 8.0f;
        case 5 : return ((63.0f * x * x * x * x * x) - (70.0f * x * x * x) + (15.0f * x)) / 8.0f;
        default : return 1.0f;
    }
    return 1.0f;
}

float getBasisCosine(int n, float x)
{
    switch (n)
    {
        case 0 : return cos(PI * x);
        case 1 : return cos(2.0f * PI * x);
        case 2 : return cos(4.0f * PI * x);
        case 3 : return cos(8.0f * PI * x);
        case 4 : return cos(12.0f * PI * x);
        default : return 1.0f;
    }
    return 1.0f;
}

float getBasisHat(int n, float x)
{
    switch (n)
    {
        case 0 : return -fabs(x);
        case 1 : return -fabs(x + 2.0f);
        case 2 : return -fabs(x + 1.0f);
        case 3 : return -fabs(x - 2.0f);
        case 4 : return -fabs(x - 1.0f);
        default : return 1.0f;
    }
    return 1.0f;
}

float integrate(int ns, float* sx, int order)
{
    float dx = 2.0f / (float)(ns - 1);
    float val = 0.0f;
    for (int idx = 0; idx < ns; ++idx)
    {
        float x = ((float)idx * dx) - 1.0f;
        float basis = getBasisLegendre( order, x );
        val += basis * sx[ idx ] * dx;
    }
    return val;//(((2.0f * order) - 1.0f) / 2.0f) * val;
}

float integrate2d(int ns, float* sx, int order)
{
    int axis = sqrt((float)ns);
    float dx = 1.0f / (float)axis;
    float dy = 1.0f / (float)axis;
    float val = 0.0f;
    float x = -1.0f, y = -1.0f;
    for (int idxY = 0; idxY < axis; ++idxY, y += 0.666666f)
    {
        for (int idxX = 0; idxX < axis; ++idxX, x += 0.666666f)
        {
            int idx = getidx( axis, idxX, idxY );
            float basisX = getBasisLegendre( order, x ) * dx;
            float basisY = getBasisLegendre( order, y ) * dy;
            val += basisX * basisY * sx[ idx ];
        }
        x = -1.0f;
    }
    return val;//(((2.0f * order) - 1.0f) / 2.0f) * val;
}

float approximate(int nk, float* kn, float x, float y)
{
    float summ = 0;
    for (int idx = 0; idx < nk; ++idx)
    {
        float basisX = getBasisLegendre( idx, x );
        float basisY = getBasisLegendre( idx, y );
        summ += basisX * basisY * kn[ idx ];
    }
    return summ;
}

int main() {
    
    float signals[16] = {
                          0.0f, 0.0f, 0.0f, 0.0f,
                          0.0f, 0.0f, 0.0f, 0.0f,
                          1.0f, 0.0f, 0.0f, 0.0f,
                          0.0f, 0.0f, 0.0f, 0.0f
                       };
    
    // Coefficients evaluation
    float k0 = integrate2d( 16, &signals[0], 0 );
    float k1 = integrate2d( 16, &signals[0], 1 );
    float k2 = integrate2d( 16, &signals[0], 2 );
    float k3 = integrate2d( 16, &signals[0], 3 );
    float k4 = integrate2d( 16, &signals[0], 4 );
    
    std::cout << k0 << "; " << k1 << "; " << k2 << "; " << k3 << "; " << k4 << std::endl << std::endl;
    
    // Approximation
    float kn[5] = { k0, k1, k2, k3, k4 };
    float xn[16];
    float x = -1.0f, y = -1.0f;
    for (int i = 0, yy = 0; yy < 4; ++yy, y += 0.666666f)
    {
        for (int xx = 0; xx < 4; ++xx, ++i, x += 0.666666f)
        {
            xn[ i ] = approximate( 5, &kn[0], x, y );
            float f = xn[ i ];
            std::cout << i << " = " << f << ";  " << std::endl;
        }
        x = -1.0f;
    }

    return 0;
}
*/

/*
#include <iostream>
#include <cmath>

constexpr float PI = 3.14159265f;
constexpr float EPS = 0.00001f;

typedef struct f3
{
    f3(float _x, float _y, float _z) : x(_x), y(_y), z(_z) {};
    f3 toSpherical()
    {
        f3 sph(atan(x/(y+EPS)), atan(sqrtf((x*x)+(y*y))/(z+EPS)), sqrtf((x*x)+(y*y)+(z*z)));
        return sph;
    }
    float x, y, z;
} f3;

float factorial(int n)
{
    float fac = 1.0f;
    for(int i = 1; i <= n; ++i) {
        fac *= (float)i;
    }
    return fac;
}

float HSHGetNormFactor(int band, int order)
{
    float fBand = (float)band; // l
    float fOrder = (float)order; // m
    float facNeg = factorial((int)(fBand - fabs(fOrder)));
    float facPos = factorial((int)(fBand + fabs(fOrder)));
    float c0 = (2.0f * fBand) + 1.0f;
    float c1 = 2.0f * PI * facPos;
    float nf = sqrtf((c0 * facNeg) / c1);
    return nf;
}

float HSHGetShiftedALP(int band, int order, float x)
{
    float pmm = 1.0f;
    if ( order > 0 ) {
        float somx2 = sqrt((1.0f-x)*(1.0f+x));
        float fact = 1.0f;
        for ( int i=1; i<=order; i++ ) {
            pmm *= (-fact) * somx2;
            fact += 2.0f;
        }
    }
    if( band == order )
        return pmm;

    float pmmp1 = x * (2.0f*order+1.0f) * pmm;
    if ( band == order+1 )
        return pmmp1;

    float pll = 0.0f;
    for ( int ll=order+2; ll<=band; ++ll ) {
        pll = ( (2.0f*ll-1.0)*x*pmmp1-(ll+order-1.0f)*pmm ) / (ll- order);
        pmm = pmmp1;
        pmmp1 = pll;
    }

    return pll;
}

float HSHGetBasisSpherical(int band, int order, float theta, float phi)
{
    if (order > 0)
    {
        float fOrder = (float)order;
        float nf = HSHGetNormFactor( band, order );
        float salp = HSHGetShiftedALP( band, order, cosf((2.0f * theta) - 1.0f) );
        float h = sqrtf(2.0f) * nf * cosf(fOrder * phi) * salp;
        return h;
    }
    else if (order < 0)
    {
        float fOrder = (float)order;
        float nf = HSHGetNormFactor( band, order );
        float salp = HSHGetShiftedALP( band, -order, cosf((2.0f * theta) - 1.0f) );
        float h = sqrtf(2.0f) * nf * sinf(-fOrder * phi) * salp;
        return h;
    }
    else if (order == 0)
    {
        float nf = HSHGetNormFactor( band, 0 );
        float salp = HSHGetShiftedALP( band, 0, cosf((2.0f * theta) - 1.0f) );
        float h = nf * salp;
        return h;
    }
    return 0.0f;
}

int main()
{
    f3 sVecX(1.0f, 0.0f, 0.0f);
    f3 sVecY(0.0f, 1.0f, 0.0f);
    f3 sVecZ(0.0f, 0.0f, 1.0f);
    sVecX.toSpherical();
    sVecY.toSpherical();
    sVecZ.toSpherical();
    float basisXn1 = HSHGetBasisSpherical( 1, -1, sVecX.x, sVecX.y );
    float basisXp0 = HSHGetBasisSpherical( 1, 0, sVecX.x, sVecX.y );
    float basisXp1 = HSHGetBasisSpherical( 1, 1, sVecX.x, sVecX.y );
    float basisYn1 = HSHGetBasisSpherical( 1, -1, sVecY.x, sVecY.y );
    float basisYp0 = HSHGetBasisSpherical( 1, 0, sVecY.x, sVecY.y );
    float basisYp1 = HSHGetBasisSpherical( 1, 1, sVecY.x, sVecY.y );
    float basisZn1 = HSHGetBasisSpherical( 1, -1, sVecZ.x, sVecZ.y );
    float basisZp0 = HSHGetBasisSpherical( 1, 0, sVecZ.x, sVecZ.y );
    float basisZp1 = HSHGetBasisSpherical( 1, 1, sVecZ.x, sVecZ.y );
    
    std::cout << HSHGetBasisSpherical( 0, 0, 0.0f, 0.0f ) << std::endl;
    std::cout << HSHGetBasisSpherical( 1, 0, PI/2.0f, 0.0f ) << std::endl;
    std::cout << HSHGetBasisSpherical( 1, 0, PI/2.0f, -PI/2.0f ) << std::endl;
    std::cout << HSHGetBasisSpherical( 1, -1, PI/2.0f, -PI/2.0f ) << std::endl;
    std::cout << std::endl;
    std::cout << basisXn1 << "; " << basisXp0 << "; " << basisXp1 << std::endl;
    std::cout << basisYn1 << "; " << basisYp0 << "; " << basisYp1 << std::endl;
    std::cout << basisZn1 << "; " << basisZp0 << "; " << basisZp1 << std::endl;
    
    return 0;
}
*/