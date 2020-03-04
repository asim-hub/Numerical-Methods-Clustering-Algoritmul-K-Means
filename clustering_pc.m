function centroids = clustering_pc(points, NC)
	centroids = [];
  %aleg cei NC centroizi random
  rand_idx= randperm(size(points,1));
  initial_centroids= points(rand_idx(1:NC), :);
  centroids = initial_centroids;
  %matrice pe care o folosesc pentru a ma opri
  %atunci cand solutia converge:
  back_centroids = zeros(NC, 3);
  %nr de linii din matricea de puncte
  linii = size(points,1);
  while (centroids != back_centroids)
    %initializez matricea de comparat
    back_centroids = centroids;
    i=linii;
   while i>0
      k = 1;
      %acesta esre un prim minim pe care il folosesc pentru comparatie
      m = sum((points(i,:) - centroids(1,:)) .^ 2);
      j=NC;
      while j >= 2
        if(sum((points(i,:) - centroids(j,:)) .^ 2) < m)
        %calculez distanta fata de toti centroizi si compar 
          m = sum((points(i,:) - centroids(j,:)) .^ 2);
          k = j;
        endif
        j=j-1;
      endwhile
      %vector de indici corespunzatori centroizilor
      indc(i)=k;
      i=i-1;
    endwhile
  clstr=0;
  k=NC;
  %recalculez pozitiile centroidului
  while k>0
  clstr= find(indc==k);
  centroids(k,:)= mean(points(clstr,:));
  clstr=0;
  k=k-1;
  endwhile 
  endwhile    
end
    