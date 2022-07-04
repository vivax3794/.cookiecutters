#![windows_subsystem = "windows"]

use bevy::prelude::*;

use {{ cookiecutter.project_name }}::game;

/// Create app
fn main() {
    App::new()
        .insert_resource(ClearColor(Color::rgb(0., 0., 0.)))
        .add_plugins(DefaultPlugins)
        .add_plugin(game::GamePlugin)
        .add_startup_system(setup_camera)
        .run();
}

/// Add camera to world
fn setup_camera(mut commands: Commands) {
    commands.spawn_bundle(OrthographicCameraBundle::new_2d());
}
