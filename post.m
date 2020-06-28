points=load(argv(){1});
points(:,2)*=-1;
points-=points(1,:);
points(:,1)=points(:,1)/points(3,1)*200;points(:,2)=points(:,2)/points(2,2)*200;points=floor(points);

pkg load geometry

hold on
axis("equal")
for bound = 40:20:200
   drawCircle(0, 0, bound, 'k');
end
points=points(4:end,:);
score = 10 * (1 - sum((points / 200).^2,2));
plot(points(:,1), points(:,2),'ro');
m=mean(points);
plot(m(1,1), m(1,2), 'go');
s=std(points);
drawEllipse(m(1,1), m(1,2), s(1,1), s(1,2), 'b');
summary=sprintf("mean %d %d std %d %d score %f", round(m(1,1)), round(m(1,2)), round(s(1,1)), round(s(1,2)), mean(score))
title(summary);
print(sprintf("%s.png", argv(){1}))
save(sprintf("%s.stats", argv(){1}));
