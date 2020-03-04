% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; 
  %nr de linii din matricea de puncte
	  linii=size(points,1);  
  %nr de clustere  
    NC=size(centroids,1);
   for i=1:linii
      k = 1;
      m = 10000000;
      for j=1:NC
    %calculez normele si o aleg pe cea mai mica
        if(norm(points(i,:) - centroids(j,:)) < m)
          m = norm(points(i,:) - centroids(j,:));
          k = j;
        endif
      endfor
     %calculez costul  
    cost=cost+m;
    endfor
end

