.class public LX/04I;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static volatile A05:LX/04I;


# instance fields
.field public A00:Ljava/util/Date;

.field public A01:Z

.field public final A02:LX/01p;

.field public final A03:LX/03I;

.field public final A04:LX/01E;


# direct methods
.method public constructor <init>(LX/01p;LX/03I;LX/01E;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "meManager",
            "waSharedPreferences",
            "waNotificationManager"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LX/04I;->A02:LX/01p;

    iput-object p3, p0, LX/04I;->A04:LX/01E;

    iput-object p2, p0, LX/04I;->A03:LX/03I;

    return-void
.end method

.method public static A00()LX/04I;
    .registers 5

    sget-object v0, LX/04I;->A05:LX/04I;

    if-nez v0, :cond_23

    const-class v4, LX/04I;

    monitor-enter v4

    :try_start_7
    sget-object v0, LX/04I;->A05:LX/04I;

    if-nez v0, :cond_1e

    invoke-static {}, LX/01p;->A00()LX/01p;

    move-result-object v3

    invoke-static {}, LX/01E;->A00()LX/01E;

    move-result-object v2

    invoke-static {}, LX/03I;->A00()LX/03I;

    move-result-object v1

    new-instance v0, LX/04I;

    invoke-direct {v0, v3, v1, v2}, LX/04I;-><init>(LX/01p;LX/03I;LX/01E;)V

    sput-object v0, LX/04I;->A05:LX/04I;

    :cond_1e
    monitor-exit v4

    goto :goto_23

    :catchall_20
    move-exception v0

    monitor-exit v4
    :try_end_22
    .catchall {:try_start_7 .. :try_end_22} :catchall_20

    throw v0

    :cond_23
    :goto_23
    sget-object v0, LX/04I;->A05:LX/04I;

    return-object v0
.end method

.method public static A01()Z
    .registers 2

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v1, "chromium"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v0, 0x1

    if-nez v1, :cond_14

    :cond_13
    const/4 v0, 0x0

    :cond_14
    return v0
.end method


# virtual methods
.method public A02()Ljava/util/Date;
    .registers 9

    iget-object v0, p0, LX/04I;->A04:LX/01E;

    iget-object v1, v0, LX/01E;->A00:Landroid/content/SharedPreferences;

    const-string v0, "software_forced_expiration"

    const-wide/16 v2, 0x0

    invoke-interface {v1, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    cmp-long v0, v4, v2

    if-gtz v0, :cond_6c

    const-string v0, "client_expiration_time"

    invoke-interface {v1, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    cmp-long v0, v4, v2

    if-gtz v0, :cond_6c

    iget-object v0, p0, LX/04I;->A02:LX/01p;

    invoke-virtual {v0}, LX/01p;->A05()V

    iget-object v7, v0, LX/01p;->A00:Lcom/smokey/Me;

    const/4 v6, -0x1

    if-eqz v7, :cond_4e

    :try_start_24
    iget-object v0, v7, Lcom/smokey/Me;->number:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4e

    iget-object v0, v7, Lcom/smokey/Me;->number:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    const-wide/16 v0, 0xe

    rem-long/2addr v4, v0

    long-to-int v6, v4

    goto :goto_4e
    :try_end_3b
    .catch Ljava/lang/NumberFormatException; {:try_start_24 .. :try_end_3b} :catch_3b

    :catch_3b
    move-exception v4

    const-string v0, "number format not valid: "

    invoke-static {v0}, LX/00I;->A0a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, v7, Lcom/smokey/Me;->number:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/whatsapp/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4e
    :goto_4e
    if-ltz v6, :cond_57

    const/16 v0, 0xd

    if-gt v6, v0, :cond_57

    add-int/lit8 v0, v6, -0x6

    int-to-long v2, v0

    :cond_57
    const-wide v4, Ox3a3beb568f40L

    invoke-static {}, Lcom/smokey/yo/yo;->getExpDays()J

    move-result-wide v0

    add-long/2addr v2, v0

    const-wide/32 v0, 0x5265c00

    mul-long/2addr v2, v0

    add-long/2addr v2, v4

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    return-object v0

    :cond_6c
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public A03()Z
    .registers 3

    iget-boolean v0, p0, LX/04I;->A01:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    return v0

    :cond_6
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0}, LX/04I;->A02()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    iput-boolean v0, p0, LX/04I;->A01:Z

    return v0
.end method

.method public A04()Z
    .registers 6

    iget-object v0, p0, LX/04I;->A00:Ljava/util/Date;

    const/4 v3, 0x1

    if-nez v0, :cond_35

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    const-wide v1, 0x17c1e3d5748L

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_33

    invoke-virtual {p0}, LX/04I;->A02()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    const-wide v0, 0x757b12c00L

    add-long/2addr v2, v0

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v0}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_35

    :cond_33
    iput-object v4, p0, LX/04I;->A00:Ljava/util/Date;

    :cond_35
    return v3
.end method
