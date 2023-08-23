use axum::{routing::get, Router};
use sqlx::PgPool;

async fn hello_world() -> &'static str {
    "Hello, world!"
}

#[shuttle_runtime::main]
async fn axum (
    #[shuttle_shared_db::Postgres] pool: PgPool
) -> shuttle_axum::ShuttleAxum {
    sqlx::migrate!().run(&pool)
        .await
        .expect("Migrations failed :(");

    let router = Router::new().route("/", get(hello_world));

    Ok(router.into())
}
