function [ mated_1, mated_2 ] = mate_2_( mate_1, mate_2, change_pos)
  mated_1 = mate_1;
  mated_2 = mate_2;
  mated_1(change_pos : end) = mate_2(change_pos : end);
  mated_2(change_pos : end) = mate_1(change_pos : end);
end

