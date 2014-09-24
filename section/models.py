# -*- coding: utf-8 -*-
from django.db import models

class Section(models.Model):
    title = models.CharField(max_length = 64)
    content = models.TextField()
    time = models.DateTimeField(auto_now = True)

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = u'栏目'
        verbose_name_plural = u'栏目'

class Picture(models.Model):
    url = models.ImageField(upload_to = 'pictures')
    description = models.CharField(max_length = 64, null = True, blank = True)

    def __unicode__(self):
        return self.url

    class Meta:
        verbose_name = u'轮播图片'
        verbose_name_plural = u'轮播图片'

class Submission(models.Model):
    url = models.FileField(upload_to = 'files')
    description = models.CharField(max_length = 64, null = True, blank = True)

    def __unicode__(self):
        return self.url

    class Meta:
        verbose_name = u'附件'
        verbose_name_plural = u'附件'