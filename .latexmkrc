# Run from the repository root. Keep intermediate files under development/.
use File::Basename qw(basename);

@default_files = ('main.tex');
$do_cd = 0;
my @sources = grep { /\.tex$/i && -f $_ } @ARGV;
my $source = @sources ? $sources[-1] : 'main.tex';
if (basename($source) eq 'main.tex') {
    $out_dir = 'development/build/main';
    $out2_dir = '.';
} else {
    my $name = basename($source, '.tex');
    $out_dir = "development/build/previews/$name";
    $out2_dir = $out_dir;
}
$aux_dir = $out_dir;
@out2_exts = ('pdf');
