# project(
#     'ycsbc-zyh',
#     'cpp',
#     version: '1.0',
#     default_options: ['cpp_std=c++11'],
# )

# rocksdb_include = '/home/td/rocksdb-6.10.1/include'
# rocksdb_lib = '/home/td/rocksdb-6.10.1/'
# hdr_include = '/home/td/HdrHistogram_c/include'
# hdr_lib = '/home/td/HdrHistogram_c/build'

# pthread_dep = dependency('threads')
# libhdr_dep = declare_dependency(
#     link_args: ['-L' + hdr_lib, '-lhdr_histogram'],
#     include_directories: include_directories(hdr_include),
# )
# librocksdb_dep = declare_dependency(
#     link_args: ['-L' + rocksdb_lib, '-lrocksdb'],
#     include_directories: include_directories(rocksdb_include),
# )

# project_dependencies = [libhdr_dep, librocksdb_dep, pthread_dep]

# project_include_directories = [
#     include_directories('.'),
# ]

# subdir('core')
# subdir('db')
# subdir('lib')

# executable(
#     'ycsbc',
#     sources: 'ycsbc.cc',
#     include_directories: project_include_directories,
#     dependencies: project_dependencies,
#     link_with: [ycsbc_core_lib, ycsbc_db_lib],
#     link_args: '-DCMAKE_EXPORT_COMPILE_COMMANDS=1',
#     build_rpath: rocksdb_lib,
# )

project(
    'ycsbc-zyh',
    'cpp',
    version: '1.0',
    default_options: ['cpp_std=c++11'],
)

# rocksdb_include = '/home/td/CruiseDB-wp/include'
# rocksdb_lib = '/home/td/CruiseDB-wp/'
rocksdb_include='/home/td/rocksdb-6.10.1/include'
rocksdb_lib='/home/td/rocksdb-6.10.1/'
hdr_include = '/home/td/HdrHistogram_c/include'
hdr_lib = '/home/td/HdrHistogram_c/build'

pthread_dep = dependency('threads')
cc = meson.get_compiler('cpp')
hdr_dep = declare_dependency(
    link_args: ['-L' + hdr_lib, '-lhdr_histogram'],
    include_directories: include_directories(hdr_include),
)
rocksdb_dep = declare_dependency(
    link_args: ['-L' + rocksdb_lib, '-lrocksdb'],
    include_directories: include_directories(rocksdb_include),
)

# rocksdb_dep = cc.find_library(
#     'rocskdb',
#     dirs: [rocksdb_lib],
#     #has_headers: [rocksdb_include]
# )
# hdr_dep = cc.find_library(
#     'hdr',
#     dirs: [hdr_lib],
#     #has_headers: [hdr_include],
# )
project_dependencies =[
    pthread_dep,
    hdr_dep,
    rocksdb_dep
]
project_include_directories = include_directories('.')
ycsbc_sources = []
subdir('core')
subdir('db')
subdir('lib')
ycsbc_sources += files('ycsbc.cc')
ycsbc_sources += ycsbc_core_source
ycsbc_sources += ycsbc_db_source

executable(
    'ycsbc',
    sources: ycsbc_sources,
    include_directories: project_include_directories,
    dependencies: project_dependencies,
    link_args: '-DCMAKE_EXPORT_COMPILE_COMMANDS=1',
    build_rpath: rocksdb_lib,
)