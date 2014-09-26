# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User

class Team(models.Model):
    name = models.CharField(max_length = 64, unique = True)
    leader = models.ForeignKey('Member', related_name = 'leader')
    teacher = models.CharField(max_length = 64)
    isActive = models.BooleanField(default = True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'队伍'
        verbose_name_plural = u'队伍'

class Member(models.Model):
    team = models.ForeignKey(Team)
    user = models.ForeignKey(User)
    isLeader = models.BooleanField(default = False)
    name = models.CharField(max_length = 16, null = True, blank = True)
    email = models.EmailField(null = True, blank = True)
    phone = models.CharField(max_length = 16, null = True, blank = True)
    microPhone = models.CharField(max_length = 16, null = True, blank = True)
    qq = models.CharField(max_length = 16, null = True, blank = True)
    domitory = models.CharField(max_length = 16, null = True, blank = True)
    sno = models.CharField(max_length = 16, null = True, blank = True)
    collage = models.CharField(max_length = 32, null = True, blank = True)
    major = models.CharField(max_length = 32, null = True,  blank = True)
    sclass = models.CharField(max_length = 32, null = True, blank = True)

    def __unicode__(self):
        return self.team + '/' + self.name

    class Meta:
        verbose_name = u'队员'
        verbose_name_plural = u'队员'

class Profile(models.Model):
    description = models.CharField(max_length = 64, null = True, blank = True)
    team = models.ForeignKey(Team)

    def __unicode__(self):
        return self.team + '\'s profile'

    class Meta:
        verbose_name = u'队伍材料'
        verbose_name_plural = u'队伍材料'