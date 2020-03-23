// 1. n: 模数
// 2. e: 公钥指数
// 3. d: 私钥指数
// 4. p: 最初的大素数
// 5. q: 最初的大素数
// 6. dmp1: e*dmp1 = 1 (mod (p-1))
// 7. dmq1: e*dmq1 = 1 (mod (q-1))
// 8. iqmp: q*iqmp = 1 (mod p )
// RSA算法是一个广泛使用的公钥算法。其密钥包括公钥和私钥。它能用于数字签名、身份认证以及密钥交换。RSA密钥长度一般使用1024位或者更高。
// 其中，公钥为n和e；私钥为n和d。在实际应用中，公钥加密一般用来协商密钥，私钥加密一般用来签名

#include <openssl/rsa.h>

int main() 
{ 
    RSA * r; 
    int bits = 512, ret; 
    unsigned long e = RSA_3; 
    BIGNUM * bne;

    //调用RSA_generate_key函数生成RSA密钥参数 
    r = RSA_generate_key(bits, e, NULL, NULL);
    //调用RSA_print_fp打印密钥信息
    RSA_print_fp(stdout, r, 11); 
    RSA_free(r);

    bne = BN_new(); 
    ret = BN_set_word(bne, e); 
    r = RSA_new(); 
    //调用RSA_generate_key_ex函数生成RSA密钥参数
    ret = RSA_generate_key_ex(r, bits, bne, NULL);

    if (ret != 1) 
    { 
        printf("RSA_generate_key_ex err!\n"); 
        return - 1; 
    }

    RSA_free(r); 
    return 0; 
}

// usage:
// 1. 编译程序
// gcc -Wall rsa_keygen.c -o rsa_keygen -lssl
// 2. 运行程序
// ./rsa_keygen