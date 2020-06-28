points=load(argv(){1});
points(:,2)*=-1;
points-=points(1,:);

maxy = points(2,2)
maxx = points(3,1)
miny = points(4,2)
minx = points(5,1)

px=polyfit([minx, 0, maxx], [-200, 0, 200], 2);
points(:,1)=polyval(px, points(:,1)')'

py=polyfit([miny, 0, maxy], [-200, 0, 200], 2);
points(:,2)=polyval(py, points(:,2)')'

points=floor(points);

pkg load geometry

hold on
axis("equal")
for bound = 20:20:200
   drawCircle(0, 0, bound, 'k');
end

score = 1 + 10 * (1 - ((sum(points.^2,2).^.5)/200))
card = floor(score)

plot(points(:,1), points(:,2),'ro');
m=mean(points);
plot(m(1,1), m(1,2), 'go');
s=std(points);
drawEllipse(m(1,1), m(1,2), s(1,1), s(1,2), 'b');
summary=sprintf("mean %d %d std %d %d mean %f card %d rounds %d", round(m(1,1)), round(m(1,2)), round(s(1,1)), round(s(1,2)), mean(score), sum(card), size(score)(1))
title(summary);
print(sprintf("%s.png", argv(){1}))
save(sprintf("%s.stats", argv(){1}));
