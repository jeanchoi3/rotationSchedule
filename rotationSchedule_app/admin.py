from django.contrib import admin
from rotationSchedule_app.models import Resident

# Register your models here.
admin.site.register(Resident)

class ResidentAdmin(admin.ModelAdmin):
    list_display = ('name','year','track','in_program')