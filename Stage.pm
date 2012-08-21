#!/usr/bin/perl

package Stage;

use strict;
use OpenGL ':all';

use base qw(Scene);
use NormalPlayer;

# コンストラクタ
sub new
{
	# パッケージ名
	my $this = shift;
	
	# メンバ変数
	my $stage = {};
	$stage->{player} = new NormalPlayer;
	
	# パッケージ名とオブジェクト名を関連させる
	bless $stage, $this;
	
	return $stage;
}

sub draw
{
	my $this = shift;
	
	$this->{player}->draw();
}

sub update
{
	my $this = shift;
	my $input_manager = shift;
	
	$this->{player}->update( $input_manager );
}

# 次のシーンに移行
sub set_next_scene
{
	
}

1;