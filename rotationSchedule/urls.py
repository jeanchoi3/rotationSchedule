from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

from rotationSchedule_app import views

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'rotationSchedule.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^$', views.index, name='index'),
    url(r'^db', views.db, name='db'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^schedule/', views.schedule, name='schedule'),
    url(r'^resident/', views.resident, name='resident'),
    url(r'^(?P<resident_id>[0-9]+)/$', views.detail, name='detail'),
                       #ex: /residentSchedule/1/

)
