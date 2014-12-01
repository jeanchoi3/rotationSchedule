from django import forms
from rotationSchedule_app.models import Resident
from django.forms import ModelForm

class ResidentForm(ModelForm):
    class Meta:
        model = Resident
        fields = ('name', 'year', 'track',)