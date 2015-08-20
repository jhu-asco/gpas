To test the ROS network setup with a simulated odom and env data, run in three seperate Matlab windows/processes:

1) Window#1

>> env_node([])


2) Window#2

>> odom_node([])


3) Window#3

>> opt.envFile='data/do1.ppm'
>> gpas_node(opt)
