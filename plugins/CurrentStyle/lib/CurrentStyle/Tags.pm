package CurrentStyle::Tags;
use strict;

sub hdlr_current_style {
    my ($ctx) = @_;
    my $blog_id = $ctx->stash('blog_id') or return '';
    my $plugin = MT->component('StyleCatcher') or return '';
    my $config = $plugin->get_config_hash();
    my $curr_theme = $config->{ "current_theme_" . $blog_id } || '';
    (my $style = $curr_theme) =~ s/.*:(.*)/$1/ if $curr_theme;
    return $style;
}

sub hdlr_current_layout {
    my ($ctx) = @_;
    my $blog_id = $ctx->stash('blog_id')  or return '';
    my $plugin = MT->component('StyleCatcher')  or return '';
    my $config = $plugin->get_config_hash();
    my $curr_layout = $config->{ "current_layout_" . $blog_id } || '';
    return $curr_layout;
}

sub hdlr_current_repository {
    my ($ctx) = @_;
    my $blog_id = $ctx->stash('blog_id')  or return '';
    my $plugin = MT->component('StyleCatcher') or return '';
    my $config = $plugin->get_config_hash();
    my $theme = $config->{ "current_theme_" . $blog_id } || '';
    (my $repository = $theme) =~ s/(repo-|)([^:]+):.*/$2/;
    return $repository;
}

sub hdlr_blog_layout {
    my $app = MT->instance;
    my $blog = $app->blog or return '';
    return $blog->page_layout || '';
}

1;
