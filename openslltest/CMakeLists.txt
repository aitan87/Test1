# CMakeList.txt: 顶层 CMake 项目文件，在此处执行全局配置
# 并包含子项目。
#

set(CMAKE_CXX_FLAGS   "-std=c++11")             # c++11
cmake_minimum_required (VERSION 3.8)

project (SSLtest)

#下面是编译选项，debug和Release模式的判断，需要注意的是关键字OR必须要大写
IF (CMAKE_BUILD_TYPE MATCHES "Debug" OR CMAKE_BUILD_TYPE MATCHES "DEBUG")
    SET(COMPILE_FLAGS "-w -O0 -g3")
    message("Debug mode")
ELSE()
    SET(COMPILE_FLAGS "-w -O3 -g")
    message("Release mode")
ENDIF()


# 把src里面的内容加入到SRC_DIR变量里面，注意，这个是从左到右的
aux_source_directory("./src" SRC_DIR)
aux_source_directory("./SM2" SM2_DIR)
# 执行shell命令，并把输出存到OUTPUT_VARIABLE指定的变量中
#execute_process(
#        COMMAND bash -c "mysql_config --libs_r"
#        OUTPUT_VARIABLE mysql_config_output
#)
set(LOG "log.txt")
execute_process(
        COMMAND bash -c "openssl genrsa -out  privkey.pem 1024"
        #COMMAND bash  -c "openssl req -new -x509 -key privkey.pem -out CAcert.pem -days 1095"
    #   OUTPUT_VARIABLE mysql_config_output
        OUTPUT_FILE  ${LOG}
)
execute_process(
        #COMMAND bash -c "openssl genrsa -out privkey.pem 1024"
        COMMAND bash  -c "openssl req -new -x509 -key privkey.pem -out CAcert.pem -days 1095"
    #   OUTPUT_VARIABLE mysql_config_output
        OUTPUT_FILE  ${LOG}
)

execute_process(
        #COMMAND bash -c "openssl genrsa -out privkey.pem 1024"
        COMMAND bash  -c "mv *.pem bin"
    #   OUTPUT_VARIABLE mysql_config_output
        OUTPUT_FILE  ${LOG}
)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)


# 如果增加多个源文件，那么这样写即可，自动会进行追加
#aux_source_directory("./src/common" SRC_DIR)

# .h文件的位置，相当于gcc编译里面的-I选项
#include_directories("./src" "./src/main")

# 需要链接的库文件目录，这里是目录，类似于LD_LIBRARY_PATH的作用，eg：LINK_DIRECTORIES("/opt/MATLAB/R2012a/bin/glnxa64")
link_directories("/usr/local/ssl/lib")
link_directories("./bin")

# 需要链接的库文件路径，注意，这里是全路径. eg: LINK_LIBRARIES("/opt/MATLAB/R2012a/bin/glnxa64/libeng.so")
# 注意和target_link_libraries的区别
#link_libraries("/usr/local/ssl/lib")


# 包含子项目，子项目里面可能包含CMakeLists.txt文件，处理新的cmake
#add_subdirectory("./src/bundle_sort")
#add_subdirectory("./src/common")

# 相当于生成最后的一个可运行文件
#add_executable(Cmake ${SRC_DIR})
add_executable(ssl_server ./src/ssl_server.c)
add_executable(ssl_client ./src/ssl_client.c)
add_executable(dsa_signed ./src/dsa_signed.c)
add_executable(md5 ./src/md5.c)
# add_executable(rsa_crypro ./src/rsa_crypto.c)
add_executable(rsa_keygen ./src/rsa_keygen.c)
add_executable(ssl_middle ./src/ssl_middle.c)
#add_executable(ECCTest ./SM2/ECC_test.c)
add_executable(sm2demo ./SM2/test_demo.c ${SM2_DIR})

# 增加编译选项
#add_definitions("-Wall -ansi")
#add_definitions("-lssl -lcrypto -ldl -lpthread")

# 专门用来打印消息的命令
#message("hello world. This is a print message!")

# 链接静态库
#target_link_libraries(Cmake bundle_sort common)
# 连接静态库也可按照下面的方式书写
#target_link_libraries(tpcc_start -lrt -L/usr/local/mysql/lib -lmysqlclient -lpthread -lm -lssl -lcrypto -ldl)
target_link_libraries(ssl_server   -lssl   -lcrypto    -ldl    -lpthread)
target_link_libraries(ssl_client   -lssl   -lcrypto    -ldl    -lpthread)
target_link_libraries(dsa_signed   -lssl   -lcrypto    -ldl    -lpthread)
target_link_libraries(md5   -lssl   -lcrypto    -ldl    -lpthread)
# target_link_libraries(rsa_crypro   -lssl   -lcrypto    -ldl    -lpthread)
target_link_libraries(rsa_keygen   -lssl   -lcrypto    -ldl    -lpthread)
target_link_libraries(ssl_middle   -lssl   -lcrypto    -ldl    -lpthread)
target_link_libraries(sm2demo   -lssl   -lcrypto    -ldl    -lpthread)
#target_link_libraries(ECCTest   -lssl   -lcrypto    -ldl    -lpthread)
# make install命令，表示将target Cmake二进制文件安装到SOURCE目录下（当然，实际不推荐这么做）
#install(TARGETS Cmake
#        RUNTIME DESTINATION ${CMAKE_SOURCE_DIR})