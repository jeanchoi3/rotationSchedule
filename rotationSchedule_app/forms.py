from django.forms import ModelForm
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation

class ResidentForm(ModelForm):
    class Meta:
        model = Resident

class YearForm(ModelForm):
    class Meta:
        model = Year

class TrackForm(ModelForm):
    class Meta:
        model = Track

class ProgramForm(ModelForm):
    class Meta:
        model = Program
        fields = ['name','startDate','endDate']

    def __init__(self, *args, **kwargs):
        super(ProgramForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs.update({'id': 'program-name','placeholder':'E.g. Penn Neurology','required':True})
        self.fields['startDate'].widget.attrs.update({'id': 'datepicker-1'})
        self.fields['endDate'].widget.attrs.update({'id': 'datepicker-2'})

class RotationForm(ModelForm):
    class Meta:
        model = Rotation