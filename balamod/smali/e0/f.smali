.class public abstract Le0/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Le0/g;

.field private static final b:[Li0/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "kotlin.reflect.jvm.internal.ReflectionFactoryImpl"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le0/g;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    nop

    :goto_0
    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Le0/g;

    invoke-direct {v0}, Le0/g;-><init>()V

    :goto_1
    sput-object v0, Le0/f;->a:Le0/g;

    const/4 v0, 0x0

    new-array v0, v0, [Li0/a;

    sput-object v0, Le0/f;->b:[Li0/a;

    return-void
.end method

.method public static a(Le0/e;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Le0/f;->a:Le0/g;

    invoke-virtual {v0, p0}, Le0/g;->b(Le0/e;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
