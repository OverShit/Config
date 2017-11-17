另外，将公钥拷贝到服务器的~/.ssh/authorized_keys文件中方法有如下几种：
1、将公钥通过scp拷贝到服务器上，然后追加到~/.ssh/authorized_keys文件中，这种方式比较麻烦。scp -P 22 ~/.ssh/id_rsa.pub user@host:~/。
2、通过ssh-copy-id程序，就是我演示的方法，ssh-copyid user@host即可
3、可以通过cat ~/.ssh/id_rsa.pub | ssh -p 22 user@host ‘cat >> ~/.ssh/authorized_keys’，这个也是比较常用的方法，因为可以更改端口号。
