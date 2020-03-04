function view_clusters(points, centroids)
    linii=size(points,1);  
    NC=size(centroids,1);
    i=linii;
    %acest while il folosesc pentru calcularea vectorului de indici pentru centroizi 
   while i>0
      k = 1;
      m = sum((points(i,:) - centroids(1,:)) .^ 2);
      j=NC;
      while j >= 2
        if(sum((points(i,:) - centroids(j,:)) .^ 2) < m)
          m = sum((points(i,:) - centroids(j,:)) .^ 2);
          k = j;
        endif
        j=j-1;
      endwhile
      indc(i)=k;
      i=i-1;
    endwhile
    %creez paleta pentru colorare
  palette = hsv(NC + 1);   
  %grupuri similare cu aceeași culoare
  colors = palette(indc, :);
  %trasez grafic
  scatter3(points(:,1), points(:,2), points(:,3),[],colors); 
    
 
