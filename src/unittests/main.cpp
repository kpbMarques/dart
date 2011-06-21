// Standard Libraries
#include <iostream>
using namespace std;
// Google Libraries
#include <gflags/gflags.h>
#include <glog/logging.h>
using namespace google;
// External Libraries
#include <gtest/gtest.h>
// Local headers
#include "test_utils.h"
#include "test_model3d.h"
#include "test_optimizer.h"

VectorXd gravity = VectorXd::Zero(3);

int main(int argc, char* argv[]) {
   ::testing::InitGoogleTest(&argc, argv);

  // Init google libraries
  ParseCommandLineFlags(&argc, &argv, true);
  InitGoogleLogging(argv[0]);

  // Define logging flag
  FLAGS_alsologtostderr = true;
  FLAGS_minloglevel = INFO;
  // FLAGS_log_dir = "./glog/";
  FLAGS_v = 0; // Make this value 1 to see the messages from the library

  return RUN_ALL_TESTS();
}
