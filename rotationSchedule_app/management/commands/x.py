from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation

class Command(BaseCommand):
    option_list = BaseCommand.option_list + (
        make_option('--long', '-l', dest='long',
            help='Help for the long options'),
    )
    help = 'Help text goes here'

    def handle(self, **options):
         #programs = Program.objects.all()
         #return programs
         prog = Program(name="ScriptNewProgram")
         prog.save()

 #NoArgsCommand, LabelCommand or AppCommand
 # handle_noargs, handle_label, handle_app