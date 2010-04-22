package DBIx::Meld::Traits::DateTimeFormat;
BEGIN {
  $DBIx::Meld::Traits::DateTimeFormat::VERSION = '0.01';
}
use Moose::Role;

=head1 NAME

DBIx::Meld::Traits::DateTimeFormat - Melds DateTime::Format::* with DBIx::Meld.

=cut

my %driver_to_formatter = (
    mysql  => 'MySQL',
    Pg     => 'Pg',
    Oracle => 'Oracle',
    MSSQL  => 'MSSQL',
    SQLite => 'SQLite',
);

=head1 METHODS

=head2 datetime_formatter

This returns the DateTime::Format::* class that is appropriate for
your database connection.

=cut

sub datetime_formatter {
    my ($self) = @_;
    return $driver_to_formatter{ $self->connector->driver->{driver} };
}

=head2 format_datetime

    # Print the current date and time in the DB's format.
    print $meld->format_datetime( DateTime->now() );

=cut

sub format_datetime {
    my ($self, $dt) = @_;
    return $self->datetime_formatter->format_datetime( $dt );
}

=head2 format_date

    print $meld->format_date( DateTime->now() );

=cut

sub format_date {
    my ($self, $dt) = @_;
    return $self->datetime_formatter->format_date( $dt );
}

1;
__END__

=head1 AUTHOR

Aran Clary Deltac <bluefeet@gmail.com>

=head1 LICENSE

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

