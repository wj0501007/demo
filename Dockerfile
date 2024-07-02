# 使用官方的Nginx作为基础镜像  
FROM nginx:stable-alpine  
  
# 将当前目录（Dockerfile所在的目录）下的内容复制到容器的/usr/share/nginx/html/  
# 假设你的B2B.AdminWeb的静态文件或构建产物在这个目录下  
COPY . /usr/share/nginx/html/  
  
# 如果你的B2B.AdminWeb需要特定的Nginx配置，可以将配置文件放在本地目录中  
# 然后将配置文件复制到容器内的/etc/nginx/conf.d/  
# 例如，COPY nginx.conf /etc/nginx/conf.d/  
  
# 如果你的服务在构建后需要一些额外的命令来准备（比如安装依赖或构建前端资源）  
# 可以在这里添加RUN指令  
# 例如，RUN npm install && npm run build  
  
# 设置工作目录为Nginx的配置目录  
WORKDIR /etc/nginx  
  
# 暴露80端口，这是Nginx的默认HTTP端口  
EXPOSE 80  
  
# 当容器启动时运行Nginx  
CMD ["nginx", "-g", "daemon off;"]