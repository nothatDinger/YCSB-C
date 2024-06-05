//
//  basic_db.cc
//  YCSB-C
//
//  Created by Jinglei Ren on 12/17/14.
//  Copyright (c) 2014 Jinglei Ren <jinglei@ren.systems>.
//

#include "db/db_factory.h"

#include <string>
#include "db/basic_db.h"
#include "db/rocksdb_db.h"

using namespace std;
using ycsbc::DB;
using ycsbc::DBFactory;

DB* DBFactory::CreateDB(utils::Properties &props) {
  if (props["dbname"] == "basic") {
    return new BasicDB;
  } else if (props["dbname"] == "rocksdb") {
    std::string prefix = props.GetProperty("file_path_prefix");
    std::string dbpath = props.GetProperty("dbpath",prefix+"rocksdb_file");
    cout <<"db:"<<dbpath.c_str()<<endl;
    return new RocksDB(dbpath.c_str(), props);
  } else return NULL;
}

