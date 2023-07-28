variable "httpd-image-name" {
  type = string
     description = "Image Docker pour le conteneur httpd"
  default = "cherif1/httpd-cherif8000"
   
  }
  


variable "nginx-image-name" {
  type = string
  description = "image Docker pour le conteneur nginx"
  default = "cherif1/nginx_cherif"
    
  
}
