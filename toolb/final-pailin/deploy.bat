rem build โปรเจ็ค
call yarn build

rem cd ไปยัง build output
cd dist

rem สั่ง git เพื่อ init/add และ commit
git init
git add -A
git commit -m 'deploy'

rem ถ้าต้องการ deploy ไปที่ https://<USERNAME>.github.io ให้ uncomment คำสั่งด้านล่าง
git push -f https://github.com/Pailin-h3/Pailin-h3/final.github.io.git master

rem ถ้าต้องการ deploy ไปที่  https://<USERNAME>.github.io/<REPO> ให้ uncomment คำสั่งด้านล่าง
rem git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages