from django.forms import ModelForm
from rotationSchedule_app.models import Resident

class ResidentForm(ModelForm):
    class Meta:
        model = Resident
        #fields = ('name', 'year', 'track',)