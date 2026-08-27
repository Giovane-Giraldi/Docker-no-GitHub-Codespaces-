FROM ubuntu:24.04 
 
WORKDIR /app 
 
COPY hello.txt . 
 
CMD ["cat", "hello.txt"] 