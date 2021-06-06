function XYZxyz = displaymodel (rgb)

load 'DELL 2212_08-21-2012_1155'

xyz = zeros(1024,3);

xyz(:,2) = mea(:,4);
xyz(:,1) = mea(:,4)./mea(:,6).*mea(:,5);
xyz(:,3) = mea(:,4)./mea(:,6).*(1-mea(:,5)-mea(:,6));

r = xyz(1:4:1024,:);
g = xyz(2:4:1024,:);
b = xyz(3:4:1024,:);
black = (r(1,:) + g(1,:) + b(1,:)) / 3;


r = r - repmat(r(1,:),[256 1]);
g = g - repmat(g(1,:),[256 1]);
b = b - repmat(b(1,:),[256 1]);

XYZ = black + r(rgb(1),:) + g(rgb(2),:) + b(rgb(3),:);
xyzoutput = [XYZ(1) XYZ(2) XYZ(3)] ./ sum(XYZ,2);

XYZxyz = [XYZ xyzoutput];

end
