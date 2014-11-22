from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

import rotationSchedule_app.views

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'rotationSchedule.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^$', rotationSchedule_app.views.index, name='index'),
    url(r'^db', rotationSchedule_app.views.db, name='db'),
    url(r'^admin/', include(admin.site.urls)),

)
