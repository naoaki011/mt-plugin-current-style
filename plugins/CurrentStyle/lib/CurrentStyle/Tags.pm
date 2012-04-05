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
    (my $style = $curr_theme) =~ s/.*:(.*)/$1/ if $curr_theme;
    return $style;
}

sub hdlr_current_layout {
    my ($ctx) = @_;

    my $blog_id = $ctx->stash('blog_id');
    my $plugin = MT->component('StyleCatcher');
    my $config = $plugin->get_config_hash();

    my $curr_layout = $config->{ "current_layout_" . $blog_id };
    return $curr_layout;
}

sub hdlr_current_repository {
    my $app = MT->instance;
    my $blog = $app->blog or return 0;
    my $plugin = MT->component('StyleCatcher');
    my $config = $plugin->get_config_hash();
    my $theme = $config->{ "current_theme_" . $blog->id } || '';
    (my $repository = $theme) =~ s/(repo-|)([^:]+):.*/$2/;
    return $repository;
}

sub hdlr_blog_layout {
    my $app = MT->instance;
    my $blog = $app->blog
      or return '';
    return $blog->page_layout;
}

1;
