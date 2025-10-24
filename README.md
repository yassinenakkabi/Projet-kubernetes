# 🧩 Déploiement de WordPress avec Kubernetes
## 🧠 À propos du projet

Ce projet a pour objectif de **déployer une application WordPress complète connectée à une base de données MySQL** dans un cluster Kubernetes, **sans utiliser Helm**.  
L’idée est d’écrire manuellement tous les **manifests YAML** afin de comprendre les composants fondamentaux de Kubernetes et leur interaction dans un déploiement réel.  

Le projet montre comment :
- **déployer des applications conteneurisées** (WordPress & MySQL),
- **exposer des services** à l’intérieur et à l’extérieur du cluster,
- **gérer la persistance des données** avec des volumes (`PersistentVolume`, `PersistentVolumeClaim`),
- et **protéger les informations sensibles** à l’aide des Secrets Kubernetes.

Ce travail permet de mieux visualiser la structure d’un **chart Helm WordPress**, en comprenant la logique de chaque ressource et son rôle dans le cluster.

---

## 🎯 Objectif du projet

Déployer **WordPress** et **MySQL** dans un environnement **Kubernetes** à l’aide de manifests YAML uniquement.  
L’objectif principal est la **compréhension complète du processus de déploiement**, sans automatisation.

---

## 🏗️ Architecture globale

| Composant | Type | Rôle |
|------------|------|------|
| `mysql-deployment.yaml` | Deployment | Déploie le conteneur MySQL |
| `mysql-service.yaml` | Service (ClusterIP) | Permet la communication interne avec WordPress |
| `mysql-pv.yaml` / `mysql-pvc.yaml` | PV / PVC | Persistance des données MySQL |
| `wordpress-deployment.yaml` | Deployment | Déploie WordPress |
| `wordpress-service.yaml` | Service (NodePort) | Rend WordPress accessible depuis le navigateur |
| `wordpress-pv.yaml` / `wordpress-pvc.yaml` | PV / PVC | Persistance des fichiers WordPress |
| `wp-secret.yaml` | Secret | Stocke les identifiants MySQL de manière sécurisée |

---

## 🪜 Étapes de déploiement

### 1️⃣ Créer les Secrets

```bash
kubectl apply -f wp-secret.yaml
kubectl apply -f mysql-secret.yaml
