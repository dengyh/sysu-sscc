# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User

class Team(models.Model):
    name = models.CharField(max_length = 64, unique = True)
    leader = models.ForeignKey('Member', related_name = 'leader')
    isActive = models.BooleanField(default = True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'队伍'
        verbose_name_plural = u'队伍'

class Member(models.Model):
    team = models.ForeignKey(Team)
    user = models.ForeignKey(User)
    name = models.CharField(max_length = 16, null = True, blank = True)
    email = models.EmailField(null = True, blank = True)
    phone = models.CharField(max_length = 16, null = True, blank = True)

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