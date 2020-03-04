% reads cluster count and points from input files 
function [NC points] = read_input_data(file_params, file_points)
	format long;
	NC = 0;
	points = [];
  %citesc numarul de clastere
  NC=dlmread(file_params)(:,1:1);
  delimiterIn=' ';
  headerlinesIn=5;
  headercolIn=0;
  %citesc multimea de puncte sub forma unei matrici
  points=dlmread(file_points,delimiterIn,headerlinesIn,headercolIn);
end

