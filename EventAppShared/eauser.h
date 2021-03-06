#ifndef EAUSERS_H
#define EAUSERS_H

#include <QQuickItem>

class EAContainer;

class EAUser : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString user READ user WRITE setUser NOTIFY userChanged)
    Q_PROPERTY(int index READ index WRITE setIndex NOTIFY indexChanged)
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(bool loggedOn READ loggedOn WRITE setLoggedOn NOTIFY loggedOnChanged)

    QString m_user;
    int m_index;
    QString m_email;
    bool m_loggedOn = false;
public:
    EAUser();
    EAUser(EAContainer *eaContainer);

    Q_INVOKABLE bool registerUser(const QString& userId,const QString &email, const QString &password);
    Q_INVOKABLE bool login(const QString& userId, const QString& password);
    Q_INVOKABLE void logoff();

    QString user() const;
    int index() const;
    QString email() const;

    EAContainer *getEaContainer() const;
    void setEaContainer(EAContainer *value);

    bool loggedOn() const;

signals:

    void userChanged(QString user);
    void indexChanged(int index);
    void emailChanged(QString email);

    void loggedOnChanged(bool loggedOn);
    void userPasswordAccepted(bool);


public slots:
    void setUser(QString user);
    void setIndex(int index);
    void setEmail(QString email);
    void setLoggedOn(bool loggedOn);

    void onResponseReady(QByteArray);
    void onDataChanged(QString);

private:
    bool isUserEmailTaken(const QString email);
    //void addIndex(const QString& table, const QString& field);

    EAContainer* eaContainer;
    QString tempPassword;
    QString tempUser;

};

#endif // EAUSERS_H
