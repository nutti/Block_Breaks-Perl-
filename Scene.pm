#!/usr/bin/perl

use strict;
use OpenGL ':all';

package Scene;

# コンストラクタ
sub new
{
	# パッケージ名
	my $this = shift;
	
	# メンバ変数
	my $scene = {};
	
	# ステートマシンの構築
	#$scene->{Stage} = new Stage
	
	# パッケージ名とオブジェクト名を関連させる
	bless $scene, $this;
	
	return $scene;
}

sub draw
{
	main::glVertex2f( 10.0, 10.0 );
	main::glVertex2f( 50.0, 50.0 );
	main::glVertex2f( 30.0, 70.0 );
}

sub update
{
}

# 次のシーンに移行
sub set_next_scene
{
	
}

1;