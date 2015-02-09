from django.contrib import admin
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation, Block, RotationLength, YearDemand, EducationReq, Event, Schedule
from django.http import HttpResponse

# Register your models here.
admin.site.register(Resident)
admin.site.register(Track)
admin.site.register(Event)
admin.site.register(Schedule)

def export_csv(modeladmin, request, queryset):
    import csv
    from django.utils.encoding import smart_str
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename=program.csv'
    writer = csv.writer(response, csv.excel)
    response.write(u'\ufeff'.encode('utf8')) # BOM (optional...Excel needs it to open UTF-8 file properly)
    writer.writerow([
        smart_str(u"ID"),
        smart_str(u"Name"),
        smart_str(u"StartDate"),
        smart_str(u"EndDate"),
    ])
    for obj in queryset:
        writer.writerow([
            smart_str(obj.pk),
            smart_str(obj.name),
            smart_str(obj.startDate),
            smart_str(obj.endDate),
        ])
    return response
export_csv.short_description = u"Export CSV"

class ResidentAdmin(admin.ModelAdmin):
    list_display = ('name','year','track','in_program')

class ProgramAdmin(admin.ModelAdmin):
	actions = [export_csv]

class RotationLengthInline(admin.TabularInline):
    model=RotationLength
    extra=1

class YearDemandInline(admin.TabularInline):
    model=YearDemand
    extra=1

class EducationReqInline(admin.TabularInline):
    model=EducationReq
    extra=1

class BlockAdmin(admin.ModelAdmin):
    inlines = (RotationLengthInline,)

class RotationAdmin(admin.ModelAdmin):
    inlines = (RotationLengthInline,YearDemandInline,EducationReqInline)

class YearAdmin(admin.ModelAdmin):
    inlines=(YearDemandInline,EducationReqInline)


admin.site.register(Program, ProgramAdmin)
admin.site.register(Block, BlockAdmin)
admin.site.register(Rotation, RotationAdmin)
admin.site.register(Year, YearAdmin)



