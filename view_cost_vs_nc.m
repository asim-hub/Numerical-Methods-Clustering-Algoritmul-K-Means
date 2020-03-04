function view_cost_vs_nc(file_points)
  %delimitator dintre valori
  delimiterIn=' ';
  %randul de la care sa inceapa citirea
  headerlinesIn=5;
  %coloana de la care incepe sa citeasca
  headercolIn=0;
  %citesc intr-o matrice punctele din fisier
  points=dlmread(file_points,delimiterIn,headerlinesIn,headercolIn);
  for k_n=1:10
    %calculez solutia convergenta /centroidul
    %k_n este numarul de clustere care variaza
    centroids=clustering_pc(points,k_n);
    %calculez costurile pentru fiecare centroid pe care la salvez intr-un vector
    allcost(k_n) = compute_cost_pc(points,centroids);
  endfor
  %trasez grficul
  plot([1:10],allcost);
end

