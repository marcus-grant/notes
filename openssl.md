---
tags: null
created: 2022-11-14T19:16:18.121Z
modified: 2022-11-14T20:05:38.538Z
---
# OpenSSL

## What is OpenSSL

OpenSSL is a library used for communication and is used for encrypting and decrypting messages and files for security purposes.

The general syntax for the terminal interface for the program is:

```sh
openssl command [ command_options ] [ command_args ]
```

To generate a private RSA key you will need to use this command:

```sh
openssl genrsa -out private.pem [ bit count ]
```

Above, `genrsa` instructs openssl to create an RSA key named `private.pem`. Another common extension instead of `*.pem` is `*.key`. The `[ bit count ]` specifies how large the key should be, default is usually 512, but that is quite insecure these days.

If you want to generate a public key from a previous one created, the syntax is:

```sh
openssl rsa -in private.pem -pubout > public.pem
```

The command above, `rsa` reads from the private key `private.pem` and outputs it to a public key file named `public.pem`.

If you need to sign documents or files with a private key, then you will need to use the following syntax. Note that it uses the cryptography function `sha1`. However, others exist like `sha256`, `sha384` and `sha512`. Additionally the example below uses a `*.txt` file, but files of any extension can be encrypted or indeed no extensions.

```sh
openssl dgst -sha1 -sign private.pem -out sha1.sign your_document.txt
```

Specifically the syntax above embeds the private key in the document `your_document.txt` by signing it using the signature `sha1.sign`.

To verify a public key together with a signature when decyprting a message, the syntax to use is:

```sh
openssl dgst -sha1 -verify public.pem -signature sha1.sign your_document.txt
```

After generating keys and verifying your signature, the next step is to encrypt a document. Following the steps above this can be achieved in the following way:

```sh
openssl rsautl -encrypt -pubin -inkey public.pem -ssl -in your_document.txt -out your_encrypted_document.txt
```

The syntax above is quite a bit more involved. The `rsautl` command can be used to sign, verify, encrypt and decrypt data by using the RSA algorith. The argument `-encrypt` is used to encrypt the input data using the RSA *public* key. The argument `pubin` signifies the input file is an RSA *public* key. The argument `-inkey` denotes the name of the keyfile. Finally, the argument `-ssl` denotes what padding to use. The remainder of the command identifies the file to encrypt and names the crypted file.

To decrypt a file using a key provided by another user, you will need to use the following syntax:

```sh
openssl rsautl -decrypt -inkey user_public_key.pem -in user_document.txt -out user_decrypted_document.txt
```

This syntax has `-decrypt` to imply to openssl to decrypt the input data by using the RSA public key provided. The remainder of the command identifies the file to decrypt and names the decrypted file.

Of course, there are many different types of encryption and decryption methods that can be used dependent on needs. However, the RSA method is the most popular and simplest to use. Feel free to review the official [OpenSSL Documentation][openssl-homepage-docs] Links to an external site. for further exploration.

## Example of the workflow to encrypt and verify SSL messages

```txt
mit/module11_client-server on  main 
❯ openssl genrsa -out myprivate.pem 512
Generating RSA private key, 512 bit long modulus
........+++++++++++++++++++++++++++
..........+++++++++++++++++++++++++++
e is 65537 (0x10001)

mit/module11_client-server on  main [?] 
❯ openssl rsa -in myprivate.pem -pubout > mypublic.pem
writing RSA key

mit/module11_client-server on  main [?] 
❯ echo "Hello World!" > hello.txt

mit/module11_client-server on  main [?] 
❯ touch hello.txt

mit/module11_client-server on  main [?] 
❯ echo "Hello World > hello.txt

mit/module11_client-server on  main [?] 
❯ echo "Hello World!" > hello.txt 

mit/module11_client-server on  main [?] 
❯ echo "Hello World > hello.txt

mit/module11_client-server on  main [?] 
❯ openssl dgst -sha1 -sign myprivate.pem -out sh1.sign hello.txt 

mit/module11_client-server on  main [?] 
❯ openssl dgst -sha1 -verify mypublic.pem -signature sh1.sign hello.txt 
Verified OK

mit/module11_client-server on  main [?] 
❯ 
```

## References

* [OpenSSL.org: Documentation][openssl-homepage-docs]
<!-- hidden references -->
[openssl-homepage-docs]: https://www.openssl.org/docs/man1.1.1/ "OpenSSL.org: Documentation"
