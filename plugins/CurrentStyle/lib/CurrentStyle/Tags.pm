package CurrentStyle::Tags;
use strict;

use File::Basename qw( basename dirname );
use MT::Util qw( remove_html decode_html );

sub hdlr_current_style {
    my ($ctx) = @_;

    my $blog_id = $ctx->stash('blog_id');
    my $plugin = MT->component('StyleCatcher');
    my $config = $plugin->get_config_hash();
    my $curr_theme = $config->{ "current_theme_" . $blog_id } || '';
    $curr_theme =~ s/default:(.*)/$1/ if $curr_theme;
    return $curr_theme;
}

sub hdlr_current_layout {
    my ($ctx) = @_;

    my $blog_id = $ctx->stash('blog_id');
    my $plugin = MT->component('StyleCatcher');
    my $config = $plugin->get_config_hash();

    my $curr_layout = $config->{ "current_layout_" . $blog_id };
    return $curr_layout;
}

1;
