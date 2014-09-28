# -*- coding: utf-8 -*-
import xadmin
from xadmin import views

from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction

from team.models import Team, Member

class TeamAdmin(object):
    list_display = ('name', 'leader', 'teacher', 'isActive')

class MemberAdmin(object):
    list_display = ('team', 'isLeader', 'name', 'name', 'phone', 'cornet',
        'qq', 'dormitory', 'sno', 'collage', 'major', 'sclass')

xadmin.site.register(Team, TeamAdmin)
xadmin.site.register(Member, MemberAdmin)
