群里面分享的EDA虚拟机工具套装，如果找不到下载地址，这个也可以下载。
链接：https://pan.baidu.com/s/1TGQ3p_NF_m4CsS2PlN4hHw
密码：cmty
这个套装里面没有安装git工具，在上传代码的时候不是很方便，所以，昨天在网上找信息同时捣鼓了一下，于是git就安装成功了。当然了，安装这个有很多的方法，今天，给大家分享我的方法。大部分转载自 https:// https://blog.csdn.net/mao_tao/article/details/78398933 有部分内容不适合上述链接分享的虚拟机，作出部分修改。
1. 安装zlib
```
wget http://www.zlib.net/zlib-1.2.11.tar.gz
tar -xvzf zlib-1.2.11.tar.gz
cd zlib-*
./configure --prefix=/usr/local
make
make install #如果非root用户需要使用sudo make install
```
2. 安装openssl
```
wget https://www.openssl.org/source/openssl-1.1.0f.tar.gz
tar -xvzf openssl-1.1.0f.tar.gz
cd openssl-*
./config --prefix=/usr/local
make
make install#如果非root用户需要使用sudo make install在root用户下执行
ln -s /usr/local/lib64/libssl.so.1.1 /usr/lib64/libssl.so.1.1
ln -s /usr/local/lib64/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1
```
3. 安装crul
```
wget https://curl.haxx.se/download/curl-7.56.1.tar.gz
tar-xvzf curl-7.56.1.tar.gz
cd curl-*
./configure --prefix=/usr/local 
make
make install#如果非root用户需要使用sudo make install
```
4. 安装github
```
wget http://kernel.org/pub/software/scm/git/git-2.9.5.tar.gz
tar -xvzf git-2.9.5.tar.gz
cd git-*
./configure --prefix=/usr/local
make
make install#如果非root用户需要使用sudo make install
```
完成这些，就可以正常使用github了。

