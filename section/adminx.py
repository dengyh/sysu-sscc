# -*- coding: utf-8 -*-
import xadmin
from xadmin import views

from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction

from section.models import Section, Picture, Submission

class SectionAdmin(object):
    list_display = ('title', 'content', 'time')

class PictureAdmin(object):
    list_display = ('url', 'description')

class SubmissionAdmin(object):
    list_display = ('url', 'description')

xadmin.site.register(Section, SectionAdmin)
xadmin.site.register(Picture, PictureAdmin)
xadmin.site.register(Submission, SubmissionAdmin)
