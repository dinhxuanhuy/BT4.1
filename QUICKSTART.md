# 🚀 Quick Start - Murach Survey Docker

## Chạy Ngay Trên Local

### Windows:
```cmd
docker-run.bat
```
Chọn option 1

### Linux/Mac:
```bash
chmod +x deploy.sh
./deploy.sh
```
Chọn option 1

### Hoặc dùng lệnh trực tiếp:
```bash
docker-compose up --build
```

## Truy Cập
http://localhost:8080

## Deploy Lên Cloud (Miễn Phí)

### 1. Railway.app (Khuyến Nghị - Dễ Nhất)
```bash
npm i -g @railway/cli
railway login
railway up
```

### 2. Render.com
1. Push code lên GitHub
2. Vào https://render.com
3. "New Web Service" → Connect repository
4. Chọn Docker → Deploy

### 3. Heroku
```bash
heroku login
heroku container:login
heroku create murach-survey-app
heroku container:push web -a murach-survey-app
heroku container:release web -a murach-survey-app
```

## Xem Hướng Dẫn Chi Tiết
- [English] DOCKER_README.md
- [Tiếng Việt] HUONG_DAN_DEPLOY.md

## Troubleshooting

### Lỗi port đã được sử dụng?
```bash
docker-compose down
netstat -ano | findstr :8080
```

### Container không chạy?
```bash
docker logs murach-survey-webapp
docker-compose up --build
```

### Muốn dọn dẹp?
```bash
docker-compose down
docker system prune -a
```

---
**Happy Deploying! 🎉**

