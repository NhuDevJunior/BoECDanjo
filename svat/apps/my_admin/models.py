from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth.models import AbstractUser
import apps.const.const as CONST
from django.db import models
from datetime import datetime
import json



class Media (models.Model):
    class Meta:
        db_table = "media"
    id = models.AutoField(primary_key=True)
    file_path = models.TextField()


class User (AbstractUser):
    class Meta:
        db_table = "users"
        app_label = 'my_admin'
    id = models.AutoField(primary_key=True)
    email = models.CharField(max_length=100, null=False, unique=True)
    name = models.TextField(null=False)
    dob = models.DateTimeField(null=True)
    gender = models.IntegerField(null=True)
    address = models.TextField(null=True,default="")
    phone_number = models.TextField(null=True)
    note = models.TextField(null=True)
    role = models.IntegerField(null=False, default=1)
    verified_token = models.TextField(null=True)
    is_verify = models.IntegerField(null=True, default=0)
    avatar = models.ForeignKey(Media, on_delete=models.CASCADE, null=True)


class Language (models.Model):
    class Meta:
        db_table = "language"
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    code = models.CharField(null=True, max_length=100)


class ProductCategory(models.Model):
    class Meta:
        db_table = "product_category"
    id = models.AutoField(primary_key=True)
    name_en = models.TextField()
    name_vi = models.TextField()


class ArticleCategory(models.Model):
    class Meta:
        db_table = "article_category"
    id = models.AutoField(primary_key=True)
    name_en = models.TextField()
    name_vi = models.TextField()


class Product (models.Model):
    class Meta:
        db_table = "product"
    id = models.AutoField(primary_key=True)
    cost = models.DecimalField(max_digits=20, decimal_places=2)
    quantity = models.IntegerField()
    view = models.IntegerField()
    des = models.TextField()
    product_category = models.ForeignKey(ProductCategory, on_delete=models.CASCADE)

    def product_language_vi(self):
        return self.productlanguage_set.filter(language_id=CONST.LANGUAGE_DICT['vi']).first()

    def product_language_en(self):
        return self.productlanguage_set.filter(language_id=CONST.LANGUAGE_DICT['en']).first()

    def product_images(self):
        return self.productimage_set.all()

    def product_thumbnail(self):
        images = self.productimage_set.all()
        return images[0].media.file_path if len(images) > 0 else ""

class ProductImage (models.Model):
    class Meta:
        db_table = "product_image"
    id = models.AutoField(primary_key=True)
    media = models.ForeignKey(Media, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)


class Article (models.Model):
    class Meta:
        db_table = "article"
    id = models.AutoField(primary_key=True)
    post_at = models.DateTimeField()
    view = models.IntegerField()
    article_category = models.ForeignKey(ArticleCategory, on_delete=models.CASCADE)
    thumbnail = models.ForeignKey(Media, on_delete=models.CASCADE)
    author = models.ForeignKey(User, on_delete=models.CASCADE)

    def article_language_vi (self):
        return self.articlelanguage_set.filter(language_id=CONST.LANGUAGE_DICT['vi']).first()

    def article_language_en (self):
        return self.articlelanguage_set.filter(language_id=CONST.LANGUAGE_DICT['en']).first()


class ArticleLanguage (models.Model):
    class Meta:
        db_table = "article_language"
    id = models.AutoField(primary_key=True)
    title = models.TextField()
    content = RichTextUploadingField(blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE)
    article = models.ForeignKey(Article, on_delete=models.CASCADE)


class ProductLanguage (models.Model):
    class Meta:
        db_table = "product_language"
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=512)
    des = RichTextUploadingField(blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)


class Order (models.Model):
    class Meta:
        db_table = "order"
    id = models.AutoField(primary_key=True)
    address = models.CharField(max_length=256)
    name = models.TextField(null=False)
    email = models.CharField(max_length=256)
    phone_number = models.CharField(max_length=256)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    shipping_fee = models.IntegerField(null=False, default=0)
    total_products = models.IntegerField(null=False, default=0) # total product in bill
    total = models.IntegerField(null=False, default=0) # product in bill + shipping fee
    # { ?????t h??ng: 0, X??? l?? ????n h??ng: 1, V???n chuy???n: 2, Ho??n Th??nh: 3, H???y b???: 4 }
    status = models.IntegerField(null=False, default=0) 
    created = models.DateTimeField(default=datetime.now)
    note = models.TextField(null=True)

    def order_product (self):
        return self.orderproduct_set.all()


class OrderProduct (models.Model):
    class Meta:
        db_table = "order_product"
    id = models.AutoField(primary_key=True)
    quantity = models.IntegerField()
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)


class ImportOrder (models.Model):
    class Meta:
        db_table = "import_order"
    id = models.AutoField(primary_key=True)
    created = models.DateTimeField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)


class ImportOrderProduct (models.Model):
    class Meta:
        db_table = "import_order_product"
    id = models.AutoField(primary_key=True)
    quantity = models.IntegerField()
    import_order = models.ForeignKey(ImportOrder, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

class Message (models.Model):
    class Meta:
        db_table = "message"
    id = models.AutoField(primary_key=True)
    name = models.TextField(null=False)
    email = models.CharField(max_length=256)
    message = models.CharField(max_length=256)
    status=models.IntegerField(null=False, default=0)
    created = models.DateTimeField(default=datetime.now)

class Comment(models.Model):
    class Meta:
        db_table = "comment"
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    content = models.TextField(null=False)
    created = models.DateTimeField(default=datetime.now)
