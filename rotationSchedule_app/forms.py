from django.forms import ModelForm
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation, Block
from django.utils.translation import ugettext_lazy as _

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
        labels = {
            'startDate': _('Start Date'),
            'endDate': _('End Date')
        }

    def __init__(self, *args, **kwargs):
        super(ProgramForm, self).__init__(*args, **kwargs)
        self.fields['startDate'].widget.attrs.update({'id': 'datepicker-1','required':True})
        self.fields['endDate'].widget.attrs.update({'id': 'datepicker-2','required':True})
        self.fields['name'].widget.attrs.update({'id': 'program-name','placeholder':'E.g. Penn Neurology','required':True})

class RotationForm(ModelForm):
    class Meta:
        model = Rotation
        fields = ['name','minResidents','maxResidents']
        labels = {
            'minResidents': _('Min # Residents'),
            'maxResidents': _('Max # Residents')
        }
    def __init__(self, *args, **kwargs):
        super(RotationForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs.update({'required':True})
        self.fields['minResidents'].widget.attrs.update({'required':True})
        self.fields['maxResidents'].widget.attrs.update({'required':True})


class BlockForm(ModelForm):
    class Meta:
        model = Block
        exclude=('includedRotation',)
        fields = ['name','length']
        labels = {
            'name': _('Block Name'),
            'length': _('Block Length (Weeks)'),
            #'includedRotation': _('Included Rotation')
        }
    def __init__(self, *args, **kwargs):
        super(BlockForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs.update({'required':True,'placeholder':'E.g. Four-week block'})
        self.fields['length'].widget.attrs.update({'required':True})