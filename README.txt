To test the ROS network setup with a simulated odom and env data, run in three seperate Matlab windows/processes:

1) Window#1

>> env_node([])


2) Window#2

>> odom_node([])


3) Window#3

>> opt.envFile='data/do1.ppm'
>> gpas_node(opt)

------------

To run with the real system but with simulated environmental data we use a custom "options" file i.e.:

1) Window 1:

>> opts = Options;  env_node(opts);

2) Window 2:

>> opts = Options;  gpas_node(opts);


---------------

To run on real system with real data, then only gpas_node is run

1) Window 1: 

>> opts = Options;  gpas_node(opts);
