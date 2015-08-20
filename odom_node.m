function S = odom_node(S)
% Simulate odometry data ROS node, by waiting for
% commanded path and taking the next pose along the path
%
%

rosshutdown
rosinit

% published odometry every at every vehicle simulation step
S.odomPub = rospublisher('/odom', rostype.nav_msgs_Odometry)
S.odomMsg = rosmessage(S.odomPub)

pause(1)

% subscriber 
cmdSub = rossubscriber('/cmd', rostype.nav_msgs_Path, {@cmdCallback, S})


% simulate initial point
S.odomMsg.Pose.Pose.Position.X = 25;
S.odomMsg.Pose.Pose.Position.Y = 25;
S.odomMsg.Pose.Pose.Orientation.Z = 1.1*pi;
send(S.odomPub, S.odomMsg)

while(1)
  pause(1)
end

function f = cmdCallback(src, msg, S)

% take the next pose along path
S.odomMsg.Pose.Pose = msg.Poses(2).Pose;
send(S.odomPub, S.odomMsg)

x = [S.odomMsg.Pose.Pose.Position.X;
     S.odomMsg.Pose.Pose.Position.Y;
     S.odomMsg.Pose.Pose.Position.Z];

disp(['cmdCallback: sent odom=' num2str(x(1)) ',' num2str(x(2))]);